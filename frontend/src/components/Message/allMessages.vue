<template>
	<v-app class="blue-grey lighten-5">
		<v-container justify-content="center" align="center">
			<v-flex>
				<v-card
					v-for="(message, index) in messageList"
					:key="index"
					flat
					hover
					:to="{ name: 'oneMessage', params: { id: message.id } }"
					class="blue-grey lighten-5"
				>
					<v-card
						class="my-10 mx-auto"
						align="center"
						min-width="30vw"
						max-width="70vw"
					>
						<v-list-item class="red lighten-3" align="start" hover>
							<v-list-item-avatar color="grey darken-3">
								<v-img :src="message.User.avatar"></v-img>
							</v-list-item-avatar>

							<v-list-item-content>
								<v-list-item-title class="font-weight-medium">{{
									message.User.username
								}}</v-list-item-title>
								<v-list-item-title class="text-caption">{{
									message.createdAt | formatDate
								}}</v-list-item-title>
							</v-list-item-content>
						</v-list-item>
						<v-row>
							<v-col>
								<v-card-title>{{ message.title }}</v-card-title>
								<v-card-text class="text-start">{{ message.content }}</v-card-text>
								<v-img
									contain
									max-height="500"
									:src="message.attachment"
								></v-img>
							</v-col>
						</v-row>

						<v-card-actions align="center">
							<v-col>
								<v-icon class="mr-1 blue--text" size="1.5rem" hover aria-label="Commenter cette publication">
									mdi-message-text</v-icon
								>
								<span>{{ message.Comments.length }}</span>
							</v-col>
							<v-col>
								<v-tooltip top>
									<template v-slot:activator="{ on, attrs }">
										<v-btn icon v-bind="attrs" v-on="on" aria-label="Aimer cette publication">
											<v-icon size="1.5rem" color="green">
												mdi-thumb-up
											</v-icon>
										</v-btn>
									</template>
									<span>J'aime</span>
								</v-tooltip>
								<span>{{ message.Likes.length }}</span>
							</v-col>
						</v-card-actions>
					</v-card>
				</v-card>
			</v-flex>
		</v-container>
	</v-app>
</template>

<script>
import axios from "axios";
import $store from "@/store/index";
import dayjs from "dayjs";

export default {
	name: "allMessages",
	components: {},
	data: () => {
		return {
			user: {},
			messageList: [],
		};
	},
	filters: {
		formatDate: function(value) {
			if (value) {
				return dayjs(String(value)).format("DD-MMM-YYYY à HH:mm");
			}
		},
	},
	mounted() {
		axios
			.get("http://localhost:3000/api/messages", {
				headers: {
					Authorization: `Bearer ${$store.state.token}`,
				},
			})
			.then((response) => {
				this.messageList = response.data;
			})
			.catch((error) => {
				console.log(error);
			});
	},
};
</script>
