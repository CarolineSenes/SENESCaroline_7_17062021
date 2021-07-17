<template>
  <v-app-bar app color="dark" dark>
    <h1>
      <v-toolbar-title
        ><router-link to="/" class="text-decoration-none white--text">
          <v-img
            src="../assets/icon.png"
            max-height="40"
            max-width="40"
            class="rounded-circle"
            alt="HOME"
          ></v-img> </router-link
      ></v-toolbar-title>
    </h1>

    <v-tooltip v-if="isLogged">
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          class="mx-2"
          to="/messages"
          icon
          v-bind="attrs"
          v-on="on"
          aria-label="Aller à la page de tous les posts"
        >
          <v-icon>
            mdi-home
          </v-icon>
        </v-btn>
      </template>
      <span>Accueil</span>
    </v-tooltip>

    <v-tooltip v-if="isLogged">
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          to="/messages/new"
          icon
          v-bind="attrs"
          v-on="on"
          aria-label="Poster un message"
        >
          <v-icon>
            mdi-email-plus
          </v-icon>
        </v-btn>
      </template>
      <span>Poster un message</span>
    </v-tooltip>
    <v-spacer></v-spacer>
    <v-tooltip v-if="isLogged">
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          @click="myProfile"
          icon
          v-bind="attrs"
          v-on="on"
          aria-label="Aller à la page de mon profile"
        >
          <v-icon>
            mdi-account
          </v-icon>
        </v-btn>
      </template>
      <span>Mon profil</span>
    </v-tooltip>

    <v-tooltip v-if="isLogged">
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          v-if= isLogged
          class="mx-2"
          @click="logout"
          icon
          v-bind="attrs"
          v-on="on"
          aria-label="Se déconnecter"
        >
          <v-icon>
            mdi-logout
          </v-icon>
        </v-btn>
      </template>
      <span>Déconnexion</span>
    </v-tooltip>
  </v-app-bar>
</template>

<script>
import { mapState } from 'vuex'
export default {

  computed:{
    ...mapState(['isLogged'])
  },

  methods: {
    logout() {
      this.$store.dispatch("logout"),
      this.$router.push("/");
    },
    myProfile() {
      if (this.$route.path == `/profile/${this.$store.state.userId}`) {
        window.location.reload();
      } else {
        this.$router.push(`/profile/${this.$store.state.userId}`);
      }
    },
  },
};
</script>
