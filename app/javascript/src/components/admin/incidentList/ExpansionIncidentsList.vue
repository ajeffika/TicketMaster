<template>
  <v-expansion-panels focusable popout light>
    <v-expansion-panel v-for="incident in incidents" :key="incident.id">
      <expansion-incidents-list-element :incident="incident"></expansion-incidents-list-element>
    </v-expansion-panel>
  </v-expansion-panels>
</template>

<script>
  import ExpansionIncidentsListElement from '@components/admin/incidentList/ExpansionIncidentsListElement';

  export default {
    name: 'ExpansionIncidentsList',
    components: { ExpansionIncidentsListElement },
    props: ['incidents'],
  };
</script>