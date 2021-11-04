$(document).ready(function() {
    animate.init();
});

var animate = {

    init: function() {
        var setup = this.setup;
        setup.animateEvents();
    },

    setup: {

        animateEvents: function() {

            // Init ScrollMagic
            var controller = new ScrollMagic.Controller();

            $('.hm-frame1').each(function() {
               var tl = gsap.timeline({defaults:{duration: 1}});
                tl .from(".banner-bg", {y:10, stagger: 1, opacity: 0})
                .from(".hm-frame1__header", {y:20, stagger: 1, opacity: 0}, "-=1")
                .from(".hm-frame1__desc", {y:20, stagger: 1, opacity: 0}, "-=.5")
                .from(".hm-frame1__button", {y:20, stagger: 1, opacity: 0}, "-=.5")
                // .from(".hm-frame1__header", {delay: 1, width: 0, stagger: 1, opacity: 0}, "-=1")

                var fadeScene = new ScrollMagic.Scene({
                    triggerElement: this,
                    triggerHook: 0.9,
                    reverse:false,
                    })
                    .setTween(tl)
                    .addTo(controller);
            });


             /*General Animation*/

            $('.animate-up').each(function() {
                var tl = gsap.timeline({defaults:{duration: .6}});
                tl.from(this, {y:10, opacity: 0})

                var fadeScene = new ScrollMagic.Scene({
                    triggerElement: this,
                    triggerHook: 0.9,
                    reverse:false,
                })
                .setTween(tl)
                .addTo(controller);
            });

            $('.animate-left').each(function() {
                var tl = gsap.timeline({defaults:{duration: 1}});
                tl.from(this, {x:40, opacity: 0})

                var fadeScene = new ScrollMagic.Scene({
                    triggerElement: this,
                    triggerHook: 0.9,
                    reverse:false,
                })
                .setTween(tl)
                .addTo(controller);
            });

            $('.animate-right').each(function() {
                var tl = gsap.timeline({defaults:{duration: 1}});
                tl.from(this, {x:-40, opacity: 0})

                var fadeScene = new ScrollMagic.Scene({
                    triggerElement: this,
                    triggerHook: 0.9,
                    reverse:false,
                })
                .setTween(tl)
                .addTo(controller);
            });
        },        
    },
}