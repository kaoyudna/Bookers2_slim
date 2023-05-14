// セレクトボックスの変更イベントをキャッチする
document.querySelector("#keyword").addEventListener("change", function() {
  // 選択された値を取得する
  var selectedValue = this.value;
  
  // Ajaxリクエストを送信する
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "/books?keyword=" + selectedValue);
  xhr.onload = function() {
    if (xhr.status === 200) {
      // セレクトボックスのオプションを更新する
      var newOptions = JSON.parse(xhr.responseText);
      var selectBox = document.querySelector("#keyword");
      selectBox.options.length = 0;
      for (var i = 0; i < newOptions.length; i++) {
        var option = document.createElement("option");
        option.value = newOptions[i].value;
        option.text = newOptions[i].text;
        selectBox.add(option);
      }
    }
  };
  xhr.send();
});
