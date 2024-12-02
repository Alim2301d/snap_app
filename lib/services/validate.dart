String? validateName(String? value){
  if(value!.isEmpty){
    return 'value must be greater than 2 char.';
  }
  if(value.toString().length< 2){
    return "value must be greater than 2 char.";
  }

  Pattern pattern = r'^[a-zA-Z]*$';
  RegExp regExp= RegExp(pattern.toString());

  if(!regExp.hasMatch(value)){
    return "value should contain only char or one Space";
  }
  return null;

}
