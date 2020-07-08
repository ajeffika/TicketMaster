<template>
  <v-container>
    <div class="home-wrapper">
      <v-container fill-height fluid>
        <v-row align="center"
               justify="center">
          <body-section/>
        </v-row>
      </v-container>
    </div>
  </v-container>
</template>


<script>
  import BodySection from '@components/admin/home/BodySection'

  export default {
    name: 'HomeView',
    components: {BodySection}
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

