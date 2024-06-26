"use strict";
/*! widgets.js | Friendkit | © Css Ninja. 2019-2020 */
$((function() {
    if ($(".schedule").length) {
        var e = document.createElement("style");
        document.head.appendChild(e);
        var t = document.querySelector(".day-header-bg")
          , a = ["primary", "pink", "purple", "green"]
          , s = document.querySelector(".day-header-close")
          , n = document.querySelector(".schedule-day-container")
          , o = document.querySelector(".next-fab")
          , i = document.querySelector(".day-header-title-day")
          , c = document.querySelector(".day-header-content")
          , r = document.querySelector(".day-header-event")
          , l = document.querySelector(".day-content")
          , d = document.querySelector(".day-content").children
          , m = document.querySelector(".day-header");
        l.addEventListener("scroll", (function(e) {
            e.target.scrollTop > 155 ? m.classList.contains("day-header--large") && (m.classList.remove("day-header--large"),
            m.classList.add("sticky"),
            m.style.height = "58px") : e.target.scrollTop < 155 && (m.classList.contains("day-header--large") || (m.classList.add("day-header--large"),
            m.classList.remove("sticky"),
            m.style.height = "280px"),
            m.style.height = 200 - e.target.scrollTop + "px")
        }
        )),
        s.addEventListener("click", (function(i) {
            n.classList.add("animate-out"),
            setTimeout((function() {
                n.classList.add("hidden"),
                n.classList.remove("animate-out"),
                c.classList.remove("animate-in"),
                l.classList.remove("animate-in"),
                m.classList.add("day-header--large"),
                m.classList.remove("sticky"),
                l.scrollTop = 0,
                s.classList.remove("animate"),
                t.classList.remove("animate"),
                a.forEach((function(e) {
                    t.classList.remove(e)
                }
                )),
                o.classList.remove("is-hidden"),
                e.innerHTML = ""
            }
            ), 155)
        }
        )),
        Array.from(document.querySelectorAll("[data-day]")).forEach((function(m) {
            var f = '.schedule .schedule-calendar .calendar-row .day.event[data-day="' + m.dataset.day + '"]:before'
              , u = a.filter((function(e) {
                return m.classList.contains(e)
            }
            ))[0];
            m.addEventListener("click", (function(h) {
                var g = h.target.classList.contains("animate")
                  , p = (h.target.getAttribute("data-content"),
                "#event-" + h.target.dataset.content);
                console.log(d),
                o.classList.add("is-hidden"),
                n.classList.remove("hidden"),
                $(".event-details-wrap").removeClass("is-active"),
                $(p).addClass("is-active"),
                t.classList.remove("animate"),
                a.forEach((function(e) {
                    t.classList.remove(e)
                }
                )),
                i.innerText = m.dataset.day,
                r.innerText = m.dataset.event,
                e.innerHTML = g ? "" : f + " {\n            top: " + h.target.offsetTop + "px;\n            left: " + h.target.offsetLeft + "px;\n          }",
                h.target.classList.add("animate");
                var y = 55
                  , L = 166;
                e.innerHTML = f + " {\n            top: " + h.target.offsetTop + "px;\n            left: " + h.target.offsetLeft + "px;\n          }\n         " + f + " {\n            transform: translate(\n              " + String(y - h.target.offsetLeft) + "px,\n              " + String(L - h.target.offsetTop) + "px\n            )\n        }",
                setTimeout((function() {
                    h.target.classList.remove("animate"),
                    t.classList.add(u),
                    t.classList.add("animate"),
                    l.classList.add("animate-in"),
                    setTimeout((function() {
                        s.classList.add("animate"),
                        c.classList.add("animate-in")
                    }
                    ), 150)
                }
                ), 150)
            }
            ))
        }
        )),
        $(".next-fab").on("click", (function() {
            $(this).toggleClass("is-toggled"),
            $(".schedule-events").slideToggle()
        }
        ))
    }
    $(".add-transition").length && $(".add-transition").on("click", (function() {
        var e = $(this)
          , t = e.closest(".transition-block").find(".page-meta span:first-child").text();
        setTimeout((function() {
            e.closest(".transition-block").hasClass("page-block") ? iziToast.show({
                maxWidth: "280px",
                class: "success-toast",
                icon: "mdi mdi-bookmark-plus",
                title: "",
                message: t + " has been added to your bookmarks",
                titleColor: "#fff",
                messageColor: "#fff",
                iconColor: "#fff",
                backgroundColor: "#344258",
                progressBarColor: "#0062ff",
                position: "bottomRight",
                transitionIn: "fadeInUp",
                close: !1,
                timeout: 1800,
                zindex: 99999
            }) : iziToast.show({
                maxWidth: "280px",
                class: "success-toast",
                icon: "mdi mdi-check",
                title: "",
                message: "Create post successfully",
                titleColor: "#fff",
                messageColor: "#fff",
                iconColor: "#fff",
                backgroundColor: "#60c032",
                progressBarColor: "#0062ff",
                position: "bottomRight",
                transitionIn: "fadeInUp",
                close: !1,
                timeout: 1800,
                zindex: 99999
            })
        }
        ), 1e3)
    }
    ))
}
));
