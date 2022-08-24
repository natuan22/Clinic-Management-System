/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function confirmLichKhamBenh(endpoint, id, btn) {
    let r = document.getElementById(`row${id}`);
    let load = document.getElementById(`load${id}`);
    load.style.display = "block";
    btn.style.display = "none";
    fetch(endpoint, {
        method: 'post'
    }).then(function (res) {
        if (res.status !== 204)
            alert("Something wrong!!!");
        load.style.display = "none";
        r.style.display = "none";
        location.reload();
    }).catch(function (err) {
        console.error(err);
        btn.style.display = "block";
        load.style.display = "none";
    });
}

function getLichKhamBenhs(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("myLichKhamBenh");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                <tr id="row${data[i].id}">
                    <td>${data[i].id}</td>
                    <td>${data[i].ngayKham}</td>
                    <td>${data[i].gioKham}</td>
                    <td>${data[i].trieuChung}</td>
                    <td>
                        <div class="spinner-border text-secondary" style="display:none" id="load${data[i].id}"></div>
                        <button class='btn btn-success' 
                                onclick="confirmLichKhamBenh('${endpoint + "/" + data[i].id}', ${data[i].id}, this)">Xac nhan</button>
                    </td>
                </tr>
            `
            d.innerHTML = h;
        }

        let d2 = document.getElementById("mySpinner2");
        d2.style.display = "none";
    }).catch(function (err) {
        console.error(err);
    });
}

function getLichKhamBenhsTrue(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("myLichKhamBenhTrue");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                <tr id="row${data[i].id}">
                    <td>${data[i].id}</td>
                    <td>${data[i].ngayKham}</td>
                    <td>${data[i].gioKham}</td>
                    <td>${data[i].trieuChung}</td>
                </tr>
            `
            d.innerHTML = h;
        }

        let d2 = document.getElementById("mySpinner");
        d2.style.display = "none";
    }).catch(function (err) {
        console.error(err);
    });
}
