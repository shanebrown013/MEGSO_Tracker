// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"

const navSlide = () => {
    document.addEventListener('DOMContentLoaded', (_event) => {
        const burger = document.querySelector('.mobile-burger');
        const nav = document.querySelector('.nav-links');
        const navLinks = document.querySelectorAll('.nav-links li');
        burger.addEventListener('click',()=>{
            nav.classList.toggle('nav-active');
            //animate mobile nav
            navLinks.forEach((link, index)=>{
                if(link.style.animation) {
                    link.style.animation = '';
                } else {
                    link.style.animation = `navLinkFade 0.5s ease forwards ${index / 7 + 0.5}s`;
                }
            });
            // mobile burger in animation
            burger.classList.toggle('toggle');

        });
    });
}

const app = () => {
    navSlide();
}
app();
Rails.start()
Turbolinks.start()
ActiveStorage.start()
