import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/app/core/widget/text_widget.dart';

class CustomDatePicker extends StatefulWidget {
  String? hint;
  IconData? prefixIcon;
  EdgeInsets? contentPadding;
  bool? enabledBorder;
  String? errorText;
  bool isRequired;
  Function(String? value)? onChangedDate;
  String? selectedDate;
  CustomDatePicker({
    super.key,
    required this.isRequired,
    this.hint,
    this.prefixIcon,
    this.contentPadding,
    this.enabledBorder,
    this.errorText,
    this.onChangedDate,
    this.selectedDate,
  });
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  var isFieldValid = true.obs;

  @override
  void initState() {
    super.initState();
    print('Selected Date: ${widget.selectedDate}');
    if (isValidDateFormat('yyyy-MM-dd', widget.selectedDate ?? '')) {
      print('Date is valid');
      _dateController.text = widget.selectedDate ?? '';
      _selectedDate =
          DateTime.parse(widget.selectedDate ?? DateTime.now().toString());
    } else {
      print('Date is not valid');
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  bool isValidDateFormat(String format, String date) {
    try {
      DateFormat(format).parse(date);
      return true;
    } catch (e) {
      if (e is FormatException) {
        return false;
      }
      rethrow;
    }
  }

  void _presentDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16),
            //height: Get.height * .7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  child: CalendarDatePicker(
                    initialDate: _selectedDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    onDateChanged: (newDate) {
                      _selectedDate = newDate;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        _dateController.text =
                            "${_selectedDate.toLocal()}".split(' ')[0];
                        widget.onChangedDate!(_dateController.text);
                        Navigator.of(context).pop();
                      },
                      child: TextWidget(
                        text: 'Done',
                        textColor: Colors.black,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      validator: (value) {
        if (widget.isRequired && (value == null || value.isEmpty)) {
          isFieldValid.value = false;
          return widget.errorText ?? 'This field is required';
        } else {
          isFieldValid.value = true;
          return null;
        }
      },
      onChanged: (value) {
        if (widget.isRequired && (value.isEmpty)) {
          isFieldValid.value = false;
        } else {
          isFieldValid.value = true;
        }
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(
          fontSize: 14,
          color: Color(0xFF969696),
          fontWeight: FontWeight.w400,
          fontFamily: 'Jost',
          height: 1.2,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                size: 20,
                color: Colors.black,
              )
            : null,
        suffixIconConstraints: const BoxConstraints(),
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: widget.contentPadding ?? EdgeInsets.zero,
        border: const UnderlineInputBorder(),
        enabledBorder: widget.enabledBorder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color(0xFF8B05FA).withOpacity(0.1),
                ),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF989898),
                ),
              ),
        focusedBorder: widget.enabledBorder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color(0xFF8B05FA).withOpacity(0.1),
                ),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF989898),
                ),
              ),
        errorBorder: widget.enabledBorder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color(0xFF8B05FA).withOpacity(0.1),
                ),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF989898),
                ),
              ),
        focusedErrorBorder: widget.enabledBorder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: const Color(0xFF8B05FA).withOpacity(0.1),
                ),
              )
            : const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF989898),
                ),
              ),
        errorText: widget.errorText == null
            ? null
            : isFieldValid.value
                ? ''
                : widget.errorText,
      ),
      readOnly: true,
      onTap: () {
        _selectedDate =
            widget.selectedDate != null && widget.selectedDate!.isNotEmpty
                ? DateTime.parse(widget.selectedDate!)
                : DateTime.now();
        _presentDatePicker(context);
      },
    );
  }
}
