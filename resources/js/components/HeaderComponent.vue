<template>
   <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li  class="nav-item active">
              <a class="nav-link" href="#" @click="getProducts()">All</a>
            </li>
            <li class="nav-item active"  v-for="category in categories" :key="category.id">
              <a class="nav-link" href="#" @click="byCategory(category.id)">{{ category.name }}</a>
            </li>
          </ul>
          <form class="form-inline mt-2 mt-md-0">
             <a href="#" class="navbar-brand d-flex align-items-center">
            <img src="/images/cart.png"  style="width: 40px;">
            <span class="badge badge-secondary badge-pill">{{ order.products.length }}</span>
          </a>
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Check out</button>
          </form>
        </div>
         
        </nav>
    </header>
</template>

<script>
export default {
	props: ["order", "products"],

	mounted() {
		this.getCategories();
		console.log("Component mounted.");
	},

	data: function() {
		return {
			categories: null
		};
	},

	methods: {
		getCategories: function($id) {
			axios.get("/api/products/getcat")
				.then(response => {
					this.categories = response.data;
					this.getProducts();
				})
				.catch(errors => {
					console.log(errors);
				});
		},
		getProducts: function() {
			this.$Progress.start();

			axios.get("/api/products")
				.then(response => {
					this.$emit("set-products", response.data);
					console.log(response.data);
					this.$Progress.finish();
				})
				.catch(errors => {
					this.$Progress.fail();
					console.log(errors);
				});
		},
		byCategory: function(id) {
			this.$Progress.start();
			axios.post("/api/products/bycat", { category_id: id })
				.then(response => {
					this.$emit("set-products", response.data);
					console.log(response.data);
					this.$Progress.finish();
				})
				.catch(errors => {
					this.$Progress.fail();
					console.log(errors);
				});
		}
	}
};
</script>