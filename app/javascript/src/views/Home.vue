<template>
  <v-container>
    <div class="home-wrapper">
      <v-container fill-height fluid>
        <v-row align="center"
               justify="center">
          <header-section/>
          <body-section/>
        </v-row>
      </v-container>
    </div>
  </v-container>
</template>

<script>
  import HeaderSection from '../components/home/HeaderSection'
  import BodySection from '../components/home/BodySection'


  export default {
    name: 'HomeView',
    components: {HeaderSection, BodySection}
  }
</script>

<style lang="scss" scoped>
  .artists-wrapper {
    @media(min-width: 1264px) {
      margin: 0 25%;
    }
  }

  .about-us-wrapper {
    background: black;
    color: white;
  }

  .home-wrapper {
    height: 75vh;
  }

</style>
