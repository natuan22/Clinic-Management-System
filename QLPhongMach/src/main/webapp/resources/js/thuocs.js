/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function deleteThuoc(endpoint, id, btn) {
    if (confirm("Bạn có chắc chắn xoá thuốc này không?") === true) {
        let r = document.getElementById(`row${id}`);
        let load = document.getElementById(`load${id}`);
        load.style.display = "block";
        btn.style.display = "none";
        fetch(endpoint, {
            method: 'delete'
        }).then(function (res) {
            if (res.status !== 204)
                alert("Something wrong!!!");
            load.style.display = "none";
            r.style.display = "none";
        }).catch(function (err) {
            console.error(err);
            btn.style.display = "block";
            load.style.display = "none";
        });
    }
    
}

function getThuocs(endpoint, edit) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("myThuoc");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                <tr id="row${data[i].id}">
                    <td>${data[i].ten}</td>
                    <td>${data[i].donGia}</td>
                    <td>${data[i].soLuong}</td>
                    <td>${data[i].ghiChu}</td>
                    <td>
                        <div class="spinner-border text-info" style="display:none" id="load${data[i].id}"></div>
                        <button class="btn btn-danger" onclick="deleteThuoc('${endpoint + data[i].id}', ${data[i].id}, this)">Xoá</button>
                    </td>
                    <td>
                        <a class="btn btn-danger" href="${edit + data[i].id}">Sửa</a>
                    </td>
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