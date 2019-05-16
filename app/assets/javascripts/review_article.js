var article

document.addEventListener('DOMContentLoaded', function () {
    article = document.getElementById('article_1').textContent
    document.getElementById('article_1').textContent = article.substr(0, 140) + '…'
}, false)

function expand_article(i) {
    document.getElementById('article_1').textContent = article
    document.getElementById('expand_1').textContent = ''
}
