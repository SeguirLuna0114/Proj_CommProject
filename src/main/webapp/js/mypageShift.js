function changePage() {
  var select = document.getElementById("cp_option_select");
  var selectedValue = select.options[select.selectedIndex].value;

  // 여기에 각 옵션에 따라 페이지 이동을 처리하는 코드를 추가
  if (selectedValue === "applyStatus_main") {
    window.location.href = "./mypage_Apply.html";
  } else if (selectedValue === "recruitStatus_main") {
    window.location.href = "./mypage_JobBoard.html";
  }
}
