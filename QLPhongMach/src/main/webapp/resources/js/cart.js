/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function addToCart(endpoint, id, ten, gia) {
    event.preventDefault();
    fetch(endpoint, {
        method: 'post',
        body: JSON.stringify({
            "thuocId": id,
            "thuocTen": ten,
            "gia": gia,
            "soLuong": 1
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        let counter = document.getElementById("cartCounter");
        counter.innerText = data;
    });
}

function updateCart(endpoint, obj, thuocId) {
    fetch(endpoint, {
        method: "put",
        body: JSON.stringify({
            "thuocId": thuocId,
            "thuocTen": "",
            "gia": 0,
            "soLuong": obj.value
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        let counter = document.getElementById("cartCounter");
        counter.innerText = data.counter;
        let amount = document.getElementById("amountCart");
        amount.innerText = data.amount;
    });
}

function deleteCartItem(thuocId) {
    if (confirm("Ban chac chan xoa thuoc nay khong?") === true) {
        fetch(`/QLPhongMach/api/cart/${thuocId}`, {
            method: "delete"
        }).then(function (res) {
            return res.json();
        }).then(function (data) {
            let counter = document.getElementById("cartCounter");
            counter.innerText = data.counter;
            let amount = document.getElementById("amountCart");
            amount.innerText = data.amount;
            let row = document.getElementById(`thuocId${thuocId}`)
            row.style.display = "none";
        });
    }
}
