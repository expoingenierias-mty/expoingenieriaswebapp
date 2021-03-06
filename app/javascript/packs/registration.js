
disableOptions = function(){
  document.getElementById('isProfessor').disabled = true;
  document.getElementById('isJudge').disabled = true;
  document.getElementById('isProfessor').checked = false;
  document.getElementById('isJudge').checked = false;

}

enableOptions = function(){
  document.getElementById('isProfessor').disabled = false;
  document.getElementById('isJudge').disabled = false;
}


manageUserableTypeRegistration = function() {
  
  judgeRegistration = document.getElementById('judge-registration');
  professorRegistration = document.getElementById('professor-registration');
  studentRegistration = document.getElementById('student-registration');
  visitorRegistration = document.getElementById('visitor-registration');
  institutionSelect = document.getElementById('institution');


  isVisitor = document.getElementById('isVisitor').checked;
  isStudent = document.getElementById('isStudent').checked
  isProfessor = document.getElementById('isProfessor').checked;
  isJudge = document.getElementById('isJudge').checked;
  

  if(isStudent || isProfessor){
    institutionSelect.style.display = "block";
  }else{
    institutionSelect.style.display = "none";
  }

  if(isStudent || isVisitor){
    disableOptions()
  }else{
    enableOptions()
  }
  

  if(isProfessor){
    professorRegistration.style.display = "block";
  }else{
    professorRegistration.style.display = "none";
  }

  if(isJudge){
    judgeRegistration.style.display = "block";
  }else{
    judgeRegistration.style.display = "none";
  }

  if(isStudent){
    studentRegistration.style.display = "block";
    professorRegistration.style.display = "none";
    judgeRegistration.style.display = "none";
    disableOptions()
    document.getElementById('isVisitor').disabled = true;
    document.getElementById('isVisitor').checked = false;
  }else{
    studentRegistration.style.display = "none";
    document.getElementById('isVisitor').disabled = false;
  }


  if(isVisitor){
    visitorRegistration.style.display = "block";
    professorRegistration.style.display = "none";
    judgeRegistration.style.display = "none";
    document.getElementById('isStudent').disabled = true;
    document.getElementById('isStudent').checked = false;
    institutionSelect.style.display = "none";
  }else{
    visitorRegistration.style.display = "none";
    document.getElementById('isStudent').disabled = false;    
  }
  

}

toggleJudgesRegistration = function() {
  judgeType = document.getElementById('judgeType').value;
  isExternal = document.getElementById('isExternal');
  isTec = document.getElementById('isTec');


  if(judgeType == 1){
    isExternal.style.display = "block";
    isTec.style.display = "none";
  }else{
    isTec.style.display = "block";
    isExternal.style.display = "none";
  }

  


}
