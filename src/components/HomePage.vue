<template>
  <div>
    <h1>{{ message }}</h1>
    <br />
    <p class="subtitle">
      {{ description }}
    </p>
  </div>
</template>

<script>
export default {
  name: "LeRizNoir",
  data() {
    return {
      message: "",
      description: "",
    };
  },
  beforeMount() {
    clearInterval(this.interval);
  },
  mounted() {
    this.setBlackRice();
    setInterval(() => this.setBlackRice(), 1000);
  },
  methods: {
    setBlackRice() {
      var message = "Ce n'est pas encore l'heure du riz noir 🤷‍♂️";
      var description =
        "L'abus de riz noir est dangereux pour la santé, à consommer avec modération.";
      const current = new Date();
      const hour = current.getHours();
      const minutes = current.getMinutes();

      if (hour == 11 && minutes < 45) {
        message = "Pas encore... mais ça va être l'heure de se préparer 🚽";
      } else if (hour == 11 && minutes >= 45) {
        message = "😋 C'est presque l'heure du riz noir !";
      } else if (hour == 12 && minutes >= 0) {
        message = "C'est l'heure du riz noir 🍚";
      } else if (hour == 15 && minutes >= 40) {
        message =
          "Ce n'est plus l'heure du riz noir mais c'est bientôt l'heure de la banane 🍌";
      } else if (hour == 16 && minutes >= 0) {
        message = "Ouiiiiiii c'est l'heure de la banane 🍌🥳";
        description =
          "L'abus de banane est dangereux pour la santé, à consommer avec modération.";
      } else if (hour == 18 && minutes <= 45) {
        message = "C'est l'heure d'aller aux Halles 🍺🍻";
      } else if (hour > 12) {
        message = "Nop ! Ce n'est plus l'heure du riz noir 😓";
      }

      this.message = message;
      this.description = description;
    },
  },
};
</script>

<style scoped>
h1 {
  margin: 150px 0 0;
}

.subtitle {
  font-weight: 400;
  line-height: 1.25rem;
  letter-spacing: .0333333333em !important;
  font-size: .75rem !important;
}
</style>
