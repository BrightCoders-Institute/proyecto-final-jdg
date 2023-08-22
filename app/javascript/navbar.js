var prevScrollpos = window.pageYOffset;
window.onscroll = function () {
  var currentScrollPos = window.pageYOffset;

  if (prevScrollpos > currentScrollPos) {
    currentScrollPos <= 21.6
      ? (document.getElementById("navbar").style.top = "21.6px")
      : (document.getElementById("navbar").style.top = "0px");
  } else {
    document.getElementById("navbar").style.top = "-186px";
  }

  prevScrollpos = currentScrollPos;
};
