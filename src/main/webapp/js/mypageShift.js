var userId = "${id}";
console.log(userId+'확인');

function changePage() {
  var select = document.getElementById("cp_option_select");
  var selectedValue = select.options[select.selectedIndex].value;

  if (selectedValue === "applyStatus_main") {
    window.location.href = "mypage_Apply.do?id=" + userId;
  } else if (selectedValue === "recruitStatus_main") {
    window.location.href = "mypage_JobBoard.do?id=" + userId;
  }
}
