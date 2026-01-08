import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NeoField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Color backgroundColor;
  final Color shadowColor;
  final double shadowOffset;
  final TextInputType? keyboardType;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  const NeoField({
    super.key,
    this.hintText,
    this.controller,
    this.backgroundColor = Colors.white,
    this.shadowColor = Colors.black,
    this.shadowOffset = 4,
    this.keyboardType,
    this.prefixText,
    this.inputFormatters,
    this.maxLength,
  });

  @override
  State<NeoField> createState() => _NeoFieldState();
}

class _NeoFieldState extends State<NeoField> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      transform: Matrix4.translationValues(
        _isFocused ? -widget.shadowOffset : 0,
        _isFocused ? -widget.shadowOffset : 0,
        0,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 3, color: Colors.black),
        boxShadow: _isFocused
            ? [
                BoxShadow(
                  color: widget.shadowColor,
                  offset: Offset(widget.shadowOffset, widget.shadowOffset),
                ),
              ]
            : [],
      ),
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: widget.prefixText != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(widget.prefixText!),
                )
              : null,
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          border: InputBorder.none,
          counterText: '',
        ),
      ),
    );
  }
}
