document.querySelectorAll(".modal-trigger.post-detail").forEach(function (element) {
    element.addEventListener("click", function () {
        var t = $(this)
                , o = t.closest(".is-post").find(".post-image img").attr("src")
                , i = t.closest(".is-post").find(".user-block .image img").attr("src")
                , e = t.closest(".is-post").find(".post-text .post-text-description").html()
                , url = t.closest(".is-post").find(".user-block .image").attr("onclick")
                , title = t.closest(".is-post").find(".post-text > h3").html()
                , status = t.closest(".is-post").find(".user-info .status-post-name").html()
                , type = t.closest(".is-post").find(".user-info .type-post-name").html()
                , quanlity = t.closest(".is-post").find(".user-info .quanlity-post").html()
                , address = t.closest(".is-post").find(".user-info .addres-post").html()
                , name = t.closest(".is-post").find(".user-info .post-name-owner").html()
                , time = t.closest(".is-post").find(".user-info .time").html()
                , intrusction = t.closest(".is-post").find(".user-info .intrucstion-post").html()
                , postImageDiv = t.closest(".is-post").find(".post-image").clone();
        void 0 !== o ? $("#share-modal-image").attr("src", o).removeClass("is-hidden") : $("#share-modal-image").addClass("is-hidden"),
                $("#share-modal-avatar").attr("src", i),
                $("#share-modal-avatar").attr("data-demo-src", i),
                $("#share-modal-avatar").attr("onclick", url),
                $("#share-modal-text").html(e),
                $("#share-modal-title").html(title),
                $("#share-modal-name").html(name),
                $("#share-modal-name").attr("onclick", url),
                $("#share-modal-type").html(type),
                $("#share-modal-status").html(status),
                $("#share-modal-quanlity").html(quanlity),
                $("#share-modal-address").html(address),
                $("#share-modal-intruc").html(intrusction),
                $("#share-modal-date").html(time),
                $(".featured-image").html(postImageDiv);
                                        initializeSliders();


    });
});