/*! main.js | Friendkit | © Css Ninja. 2019-2020 */
"use strict";var env="development";initPageloader(),$((function(){"development"===env&&(changeDemoHrefs(),changeDemoImages());var i=document.querySelectorAll("[data-lazy-load]"),e=lozad(i,{loaded:function(i){i.parentNode.classList.add("loaded")}});e.observe(),$(".demo-link a").on("click",(function(i){i.preventDefault();var e=$(this).closest(".demo-link").attr("data-theme");window.localStorage.setItem("theme",e);var t=$(this).attr("href");window.open(t)})),toggleTheme(),$(".highlight-block code").each((function(i,e){hljs.highlightBlock(e)})),initNavbar(),initNavbarV2(),initSidebarV1(),linkCheck(),initResponsiveMenu(),initNavDropdowns(),initNavbarCart(),initDropdowns(),initTabs(),initModals(),initBgImages(),feather.replace(),initEmojiPicker(),initLightboxEmojis(),initVideoEmbed(),initLoadMore(),initTooltips(),initLikeButton(),initSimplePopover(),initShareModal(),initUsersAutocomplete(),initResponseSwapModal(),initOpenModalApproveSwap(),initSuggestionSearch()}));