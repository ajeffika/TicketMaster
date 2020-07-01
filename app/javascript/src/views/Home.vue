<template>
  <div>
    <header-section />
    <body-section />
  </div>
</template>

<script>
  import HeaderSection from '../components/home/HeaderSection'
  import BodySection  from '../components/home/BodySection'


  export default {
    name: 'HomeView',
    components: { HeaderSection, BodySection }
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

  .entries-wrapper {
    background: #fbff4a;
  }
</style>
