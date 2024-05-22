import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeInputWidget extends StatelessWidget {
  final int codeLength;

  const CodeInputWidget({
    super.key,
    required this.codeLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        codeLength,
        (index) => CodeInputFieldWidget(index: index),
      ),
    );
  }
}

class CodeInputFieldWidget extends StatefulWidget {
  const CodeInputFieldWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<CodeInputFieldWidget> createState() => _CodeInputFieldWidgetState();
}

class _CodeInputFieldWidgetState extends State<CodeInputFieldWidget>
    with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  late Timer _cursorTimer;
  bool _showCursor = false;

  static String _code = '';

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();

    _cursorTimer = Timer.periodic(
      const Duration(milliseconds: 500),
      (_) {
        setState(() {
          _showCursor = !_showCursor;
        });
      },
    );
  }

  @override
  void dispose() {
    _cursorTimer.cancel();
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0.h,
      width: 60.0.w,
      child: Column(
        children: [
          TextFormField(
            showCursor: false,
            focusNode: _focusNode,
            controller: _controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0.sp),
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
            ),
            onChanged: (value) {
              print(value);
              _code += value;
              if (value.isNotEmpty && widget.index != 3) {
                _focusNode.nextFocus();
              } else if (value == '' && widget.index != 0) {
                var temp = _code.split('');
                temp[widget.index] = '';
                _code = temp.join();
                _focusNode.previousFocus();
              } else if (widget.index != 3) {
                _code = '';
              }
              print(_code);
            },
          ),
          _focusNode.hasFocus
              ? AnimatedOpacity(
                  opacity: _showCursor ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    width: _focusNode.hasFocus ? 40.0.w : 0.0,
                    height: 5.0.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5.0.r),
                    ),
                  ),
                )
              : Container(
                  width: 40.0.w,
                  height: 5.0.h,
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(_controller.text.isEmpty ? 0.2 : 1),
                    borderRadius: BorderRadius.circular(5.0.r),
                  ),
                ),
        ],
      ),
    );
  }
}
