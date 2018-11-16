<template>
<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="padding: 20px;">
       <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your cart</span>
            <span class="badge badge-secondary badge-pill">{{order.products.length}}</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed" v-for="(product, key) in order.products" :key="key">
              <div>
                <h6 class="my-0">{{product.product_name}}</h6>
                <small class="text-muted">Delicious {{product.product_name}}</small>
              </div>
              <span class="text-muted">$ {{product.product_price}}</span>
            </li>
            
            <li class="list-group-item d-flex justify-content-between bg-light">
              <div :class="{ 'text-danger': !has_discount, 'text-success': has_discount }">
                <h6 class="my-0">Coupon code</h6>
                <small>{{ coupon_code }}</small>
              </div>
              <span :class="{ 'text-danger': !has_discount, 'text-success': has_discount }">$ {{ order.discount }}</span>
            </li>
            <li class="list-group-item d-flex justify-content-between">
              <span>Total (USD)</span>
              <strong>$ {{ order.total_price }}</strong>
            </li>
          </ul>

          <form class="card p-2">
            <div class="input-group">
              <input type="text" class="form-control" v-model="coupon_code" placeholder="Promo code">
              <div class="input-group-append">
                <button type="button" class="btn btn-secondary" @click="redeemCode">Redeem</button>
              </div>
            </div>
          </form>
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Billing address</h4>
          
              <div class="mb-3">
                <label for="firstName">Name</label>
                <input type="text" class="form-control" id="name" v-model="order.customer.name" placeholder="Your full name" value="" required="">
                <div class="invalid-feedback">
                  Name is required.
                </div>
              </div>

              <div class="mb-3">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" v-model="order.customer.address" placeholder="Enter your complete address" required="">
                <div class="invalid-feedback">
                  Please enter your dilivery address.
                </div>
              </div>
              <div class="mb-3">
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="customRadioInline1" v-model="order.payment_method" value="cash" class="custom-control-input">
                  <label class="custom-control-label" for="customRadioInline1">Cash On Delivery</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="customRadioInline2" v-model="order.payment_method" value="card" class="custom-control-input">
                  <label class="custom-control-label" for="customRadioInline2">Card On Delivery</label>
                </div>
            </div>
           
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="button" @click="pay">Pay</button>
    </div>
    </div>
    </div>
  </div>
</div>
   
</template>
<script>
export default {
	props: ["order"],
	data: function() {
		return {
			coupon_code: "",
			has_discount: false
		};
	},
	methods: {
		redeemCode: function() {
			this.$Progress.start();
			axios.post("/api/redeem-code", { coupon_code: this.coupon_code })
				.then(response => {
					if (response.data.length > 0) {
						this.$Progress.finish();
						this.has_discount = true;
						this.$emit("has-discount", response.data[0].id);
					} else {
						this.$Progress.fail();
						this.has_discount = false;
						this.coupon_code = "";
					}
				})
				.catch(errors => {
					this.$Progress.fail();
				});
		},
		changePaymentMethod: function(method) {
			this.$Progress.fail();
			this.$emit("change-payment-method", method);
		},
		pay: function() {
			this.$Progress.start();
			axios.post("/api/order", this.order)
				.then(response => {
					this.$Progress.finish();
					console.log(response.data);
				})
				.catch(errors => {
					this.$Progress.fail();
				});
		}
	}
};
</script>
