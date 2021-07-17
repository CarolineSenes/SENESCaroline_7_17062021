<template>
		<v-card width="400" class="mx-auto mt-5 red lighten-5">
			<v-card-title>Se connecter</v-card-title>
			<v-card-text>
				<v-form>
					<v-text-field
						v-model="userInfo.email"
						label="Email"
						prepend-icon="mdi-account-circle"
					/>
					<v-text-field
						v-model="userInfo.password"
						:type="showPassword ? 'text' : 'password'"
						label="Password"
						prepend-icon="mdi-lock"
						:append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
						@click:append="showPassword = !showPassword"
					/>
				</v-form>
			</v-card-text>
			<v-card-actions>
				<v-spacer />
				<v-btn color="#000000" dark @click="submitForm">
					Se connecter</v-btn
				>
				<v-spacer />
			</v-card-actions>
		</v-card>
</template>

<script>
import axios from "axios";
export default {
	name: "Login",
	data() {
		return {
			valid: false,
			showPassword: false,
			userInfo: {
				email: "",
				password: "",
			},
		};
	},
	methods: {
		submitForm() {
			axios
				.post("http://localhost:3000/api/users/login", this.userInfo)
				.then((response) => {
					console.log(response);
					this.$store.dispatch("setToken", response.data.token);
					this.$store.dispatch("setAdmin", response.data.isAdmin);
					this.$store.dispatch("setUser", response.data.userId);
					this.$store.dispatch("setUsername", response.data.username);
					this.$store.dispatch("setSnackbar", {
						text: `Salut, ${response.data.username} !`,
					});
					this.$router.push({ name: "allMessages" })
				})
				.catch(() => {
					this.$store.dispatch("setSnackbar", {
						color: "error",
						text: `Identifiants incorrects !`,
					});
				});
		},
	},
};
</script>
