var article_array = []

document.addEventListener('turbolinks:load', function () {
    for (var i = 1; true; i++) {
        element = document.getElementById(`article_${i}`)
        if (element != null) {
            article_array.push(element.textContent)
            element.textContent = element.textContent.substr(0, 140) + '…'
        } else {
            break
        }
    }
}, false)

function expand_article(i) {
    document.getElementById(`article_${i}`).textContent = article_array[i - 1]
    document.getElementById(`expand_${i}`).textContent = ''
}
