import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outernet/presentation/screens/asset_links.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(left: 0),   
      icon: Transform(
        transform: Matrix4.identity()..rotateY(3.14), 
        alignment: Alignment.center, 
        child: SvgPicture.asset(
          paperPlaneIcon,
          width: 30,  
          height: 30, 
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      //padding: EdgeInsets.zero, // Xóa padding để icon không bị co giãn
      //constraints: BoxConstraints(), // Xóa giới hạn mặc định để icon giữ kích thước cụ thể
    );
  }
}
