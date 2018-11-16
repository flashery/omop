/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require("./bootstrap");

window.Vue = require("vue");
import VueProgressBar from "vue-progressbar";

Vue.use(VueProgressBar, {
    color: "rgb(61, 206, 134)",
    failedColor: "red",
    height: "5px"
});

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// Vue.component('example-component', require('./components/ExampleComponent.vue'));

const files = require.context("./", true, /\.vue$/i);
files.keys().map(key =>
    Vue.component(
        key
            .split("/")
            .pop()
            .split(".")[0],
        files(key)
    )
);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: "#app",
    data: {
        products: null,
        has_discount: false,
        order: {
            customer: {
                name: "",
                address: ""
            },
            products: [],
            discount: 0,
            payment_method: "",
            total_price: 0,
            coupon_id: 0
        }
    },
    methods: {
        hasDiscount: function(coupon_id) {
            this.has_discount = true;
            this.order.coupon_id = coupon_id;
            this.computePrice();
        },
        setProducts: function(products) {
            this.products = products;
        },
        addItem: function(product) {
            this.order.products.push(product);
            this.computePrice();
        },

        computePrice: function() {
            var price = 0.0;

            this.order.products.forEach(product => {
                price += product.product_price;
            });

            if (this.has_discount) {
                this.order.discount = this.round(price * 0.1, 2);
                this.order.total_price = price - this.order.discount;
            } else {
                this.order.total_price = price;
            }
        },
        changePaymentMethod: function(method) {
            this.order.payment_method = method;
        },
        round: function(value, decimals) {
            return Number(Math.round(value + "e" + decimals) + "e-" + decimals);
        }
    }
});
