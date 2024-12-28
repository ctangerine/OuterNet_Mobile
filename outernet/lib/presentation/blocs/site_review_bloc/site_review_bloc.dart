import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database_provider.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/usecases/site_review_usecase.dart';
import 'package:outernet/env/log_service.dart';
import 'package:outernet/presentation/blocs/site_review_bloc/site_review_event.dart';
import 'package:outernet/presentation/blocs/site_review_bloc/site_review_state.dart';

class SiteReviewBloc extends Bloc<SiteReviewEvent, SiteReviewState> {
  final SiteReviewUsecase siteReviewUsecase;
  final AppDatabase _db = dbProvider.database;
  final logger = LogService().logger;

  SiteReviewBloc(this.siteReviewUsecase) : super(InitialSiteReviewState()) {
    // on<InitializeSiteReview>(_onInitializeSiteReview);
    on<AddReview>(_onAddNewReview);
    on<UpdateReview>(_onUpdateReview);
    on<DeleteReview>(_onDeleteReview);
    on<GetDetailReview>(_onGetDetailReview);
    on<GetMyReview>(_onGetMyReview);
  }

  Future<void> _onAddNewReview(AddReview event, Emitter<SiteReviewState> emit) async {
    final result = await siteReviewUsecase.addNewReview(event.request);
    result.fold(
      (failure) {
        try {
          emit((state as SiteReviewFetchSuccess).copyWith(
            error: failure.message,
          ));
        } catch (e) {
          emit(SiteReviewFetchFailure(failure.message));
        }
        logger.e("Can't finish request, error: ${failure.message}");
      },
      (message) {
        try {
          emit((state as SiteReviewFetchSuccess).copyWith(
            message: message,
            isRecentlyAddReview: true
          ));
        } catch (e) {
          emit(SiteReviewFetchSuccess(
            reviews: [],
            message: message,
            isRecentlyAddReview: true,
          ));
          logger.e("State not stable, recheck: $e");
        }
      }
    );
  }

  Future<void> _onUpdateReview(UpdateReview event, Emitter<SiteReviewState> emit) async {
    final result = await siteReviewUsecase.updateReview(event.request, event.reviewId);
    result.fold(
      (failure) {
        try {
          emit((state as SiteReviewFetchSuccess).copyWith(
            error: failure.message,
          ));
        } catch (e) {
          emit(SiteReviewFetchFailure(failure.message));
        }
        logger.e("Can't finish request, error: ${failure.message}");
      },
      (message) {
        try {
          emit((state as SiteReviewFetchSuccess).copyWith(
            message: message,
            isRecentlyUpdateReview: true,
            reviews: (state as SiteReviewFetchSuccess).reviews.map((review) {
              if (review.id == event.reviewId) {
                return review.copyWith(comment: event.request.comment);
              }
              return review;
            }).toList()
          ));
        } catch (e) {
          emit(SiteReviewFetchSuccess(
            reviews: [ReviewEntity.defaultInstance.copyWith(
              comment: event.request.comment,
              id: event.reviewId
            )],
            message: message,
            isRecentlyUpdateReview: true,
          ));
          logger.e("State not stable, recheck: $e");
        }
      }
    );
  }

  Future<void> _onDeleteReview(DeleteReview event, Emitter<SiteReviewState> emit) async {
    final result = await siteReviewUsecase.deleteReview(event.reviewId);
    result.fold(
      (failure) {
        try {
          emit ((state as SiteReviewFetchSuccess).copyWith(
            error: failure.message,
          ));
        } catch (e) {
          emit(SiteReviewFetchFailure(failure.message));
        }
        logger.e("Can't finish request, error: ${failure.message}");
      },
      (message) {
        try {
          emit((state as SiteReviewFetchSuccess).copyWith(
            message: message,
            isRecentlyDeleteReview: true,
            reviews: (state as SiteReviewFetchSuccess)
              .reviews.where(
                (review) => review.id != event.reviewId,
              )
              .toList(),
          ));
        } catch (e) {
          emit(SiteReviewFetchSuccess(
            reviews: [],
            message: message,
            isRecentlyDeleteReview: true,
          ));
          logger.e("State not stable, recheck: $e");
        }
      }
    );
  }

  Future<void> _onGetDetailReview(GetDetailReview event, Emitter<SiteReviewState> emit) async {
    final result = await siteReviewUsecase.getDetailReview(event.reviewId);
    result.fold(
      (failure) {
        try {
          emit((state as SiteReviewFetchSuccess).copyWith(
            error: failure.message,
          ));
        } catch (e) {
          emit(SiteReviewFetchFailure(failure.message)); 
        }
        logger.e("Can't finish request, error: ${failure.message}");
      },
      (review) {
        try {
          emit((state as SiteReviewFetchSuccess).copyWith(
            specificReview: review,
            isRecentlyGetDetailReview: true
          ));
        } catch (e) {
          emit(SiteReviewFetchSuccess(
            reviews: [],
            specificReview: review,
            isRecentlyGetDetailReview: true,
          ));
          logger.e("State not stable, recheck: $e");
        }
      }
    );
  }

  Future<void> _onGetMyReview(GetMyReview event, Emitter<SiteReviewState> emit) async {
    final result = await siteReviewUsecase.getMyReview();
    result.fold(
      (failure) {
        try {
          emit((state as SiteReviewFetchSuccess).copyWith(
            error: failure.message,
          ));
        } catch (e) {
          emit(SiteReviewFetchFailure(failure.message));
          logger.e(failure.message);
        }
        logger.e("Can't finish request, error: ${failure.message}");
      },
      (reviews) {
        try {
          emit((state as SiteReviewFetchSuccess).copyWith(
            reviews: reviews,
            isRecentlyGetMyReview: true
          ));
        } catch (e) {
          emit(SiteReviewFetchSuccess(
            reviews: reviews,
            isRecentlyGetMyReview: true,
          ));
          logger.e("State not stable, recheck, error: $e");
        }

        try {
          for (ReviewEntity review in reviews) {
            _db.upsertReview(review.id!, review);
          }
        } catch (e) {
          logger.e("Can't save to local database, error: $e");
        }
      }
    );
  }
}