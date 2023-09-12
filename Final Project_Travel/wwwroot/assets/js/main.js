$(document).on("click", ".modal-btn", function (e) {
    e.preventDefault();
    let url = $(this).attr("href");

    fetch(url).then(response => response.text())
        .then(data => {
            $("#quick_view .modal-dialog").html(data)
        })
    $("#quick_view").modal("show")
})







$(document).on("click", ".wishlist-btn", function (e) {
    e.preventDefault();
    let url = $(this).attr("href");

    fetch(url).then(response => {

        if (!response.ok) {
            alert("Xeta bas verdi")
        }
        else
            return response.text()

    }).then(data => {
        $("#wishlistcard").html(data);
    }).then(() => {
        var value = $(".minicart-inner-content").attr("data-count");
        $(".notification").html(value);
    })
    })


})

function addToWishList(id) {
    var json = {
        id: id
    };

    $.ajax({
        type: 'POST',
        url: "@Url.Action(".wishlist-btn", "Tour")",
        dataType: "json",
        data: { "json": JSON.stringify(json) },
        success: function (data) {
            if (data.status == "true") {
                alert(data.msg);
                var urlToRedirect = '@Url.Action("Index","Home")';
                window.location.href = urlToRedirect; //Redirect here
            }
        },
        error: function (data) {
            alert('Some error');
            window.location.reload();
        }
    });
}


