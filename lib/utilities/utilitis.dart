String? emailValidator(String? text){
  if(text==null || text.isEmpty){
    return "Champ obligatoire";
  }
  return null;
}
String? passwordValidator(String? text){
  if(text==null || text.isEmpty){
    return "Champ obligatoire";
  }
  return null;
}