import consumer from "./consumer"

if (location.pathname.match(/\/events\/\d/)) {
  consumer.subscriptions.create({
    channel: "CommentChannel",
    event_id: location.pathname.match(/\d+/)[0]
  }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // アイコン情報を取得します
      const userIcon = document.getElementById('js-user-icon');
      const html = `
        <div class="comment">
          <img src="${userIcon.src}" width="50" height="50" class="rounded-circle">
          <p class="user-info">${data.user.name}： </p>
          <p>${data.comment.text}</p>
        </div>`;
      const comments = document.getElementById("comments")
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById("comment-form")
      commentForm.reset();
    }
  })
}
