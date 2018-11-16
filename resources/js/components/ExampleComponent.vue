<template>
    <div class="container" style="margin-top: 100px;">
        <div class="row justify-content-center">
            <p v-if="!products">Getting products..</p>
             <div class="col-md-4" v-for="product in products" :key="product.product_id">
                <div class="card mb-4 shadow-sm">
                    <img class="card-img-top" :src="'/images/' + product.product_image">
                    <div class="card-body">
                    <h3 class="card-text">{{ product.product_name }}</h3>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                        <button type="button" @click="addItem(product)" class="btn btn-sm btn-outline-secondary">Add</button>
                        </div>
                    </div>
                    </div>
                </div>
            </div>

        </div>
        <vue-progress-bar></vue-progress-bar>
    </div>
</template>

<script>
export default {
	props: ["items", "products"],
	mounted() {
		console.log("Component mounted.");
	},
	methods: {
		addItem: function(product) {
			this.$emit("add-item", product);
		}
	}
};
</script>
