<template>
  <div>
    <header-section />
  </div>

</template>

<script>
  import HeaderSection from '../components/home/HeaderSection'


  export default {
    name: 'HomeView',
    components: { HeaderSection }
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
