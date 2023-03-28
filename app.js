function show(x) {
  var a = document.querySelector(".resultdiv");
  var p = document.querySelector(".finalresultdiv");
  var q = document.querySelector(".heading");
  a.style.visibility = "visible";
  q.innerHTML = "The Unused Variables are :" + "<br>" + "<br>";
  p.innerHTML += "Variable Type" + "<br>" + "<hr>" + "<br>";
  p.innerHTML += x;
  return false;
}
