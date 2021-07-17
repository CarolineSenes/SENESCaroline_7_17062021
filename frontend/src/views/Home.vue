<template>
		<v-container align="center" class="mx-auto mt-5">
			<v-img
				class="mb-5"
				contain
				height="300"
				src="../assets/icon-above-font.png"
			></v-img>
			<!-- <v-row align="center" justify="center">
				<v-btn to="/Login" class="mr-5 my-10" color="#000000" dark
					>Connexion</v-btn
				>
				<v-btn to="/register" class="ml-5 my-10" color="#000000" dark
					>Inscription</v-btn
				>
			</v-row> -->
			<v-row>
			<Login /><Register />
			</v-row>
		</v-container>
</template>

<script>
import Login from "@/components/Auth/Login";
import Register from "@/components/Auth/Register";
export default {
	name: "Home",
	components: {
		Login,
		Register,
	},
};
</script>
