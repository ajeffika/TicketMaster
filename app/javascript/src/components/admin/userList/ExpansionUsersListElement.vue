<template>
  <div>
    <v-expansion-panel-header>
      <template v-slot:default="{ open }">
        <div class="subtitle-1" v-text="user.username"></div>
      </template>
    </v-expansion-panel-header>

    <v-expansion-panel-content>
      <div class="mt-5 mb-5">
        <div class="headline" v-text="user.username"></div>
        <div class="pre-line-description" v-html="user.email"></div>
        <div class="pre-line-description" v-html="user.firstName"></div>
        <div class="pre-line-description" v-html="user.lastName"></div>
        <div class="pre-line-description" v-html="user.role"></div>
        <div class="pre-line-description" v-html="user.groupIds"></div>
      </div>
      </v-expansion-panel-content>>
  </div>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex';
  import {UPDATE_INCIDENT} from '@/store/modules/incident/action-types';
  // import IncidentForm from '@components/global/IncidentForm';

  export default {
    name: 'ExpansionIncidentsListElement',
    components: {},
    props: ['users'],
    data() {
      return {
        editable: 0,
      };
    },
    computed: {
      ...mapGetters({
        user: 'auth/user',
      }),

      isEditable() {
        return this.editable === 1;
      },
    },
    methods: {
      ...mapActions({
        updateIncident: `incident/${UPDATE_INCIDENT}`,
      }),
      update() {
        this.updateIncident({incident: this.incident});
        this.editable = 0;
      },
    },
  };
</script>

<style lang="scss">
  .incident-form-border {
    box-shadow: 0 2px 9px 0 rgb(255, 255, 255);
  }

  .pre-line-description {
    white-space: pre-line
  }
</style>