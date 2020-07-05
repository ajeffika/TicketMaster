<template>
  <div>
    <v-expansion-panel-header>
      <template v-slot:default="{ open }">
        <div class="subtitle-1" v-text="incident.title"></div>
      </template>
    </v-expansion-panel-header>

    <v-expansion-panel-content>
      <div class="mt-5 mb-5">
        <div class="headline" v-text="incident.title"></div>
        <div class="pre-line-description" v-html="incident.description"></div>
        <div class="pre-line-description" v-html="incident.step"></div>
        <div class="pre-line-description" v-html="incident.modifierEmail"></div>
      </div>

      <v-divider></v-divider>
      <div class="contact-buttons text-center mt-5">
        <v-btn v-if="incident.phone" color="secondary mr-2" :href="`tel:${incident.phone}`">
          <span class="mr-3">
            {{$t('global.custom.call')}}
          </span>
          <v-icon>phone</v-icon>
        </v-btn>
        <v-btn color="secondary ml-2" :href="`mailto:${user.email}`">
          <span class="mr-3">
            {{$t('global.custom.sendEmail')}}
          </span>
          <v-icon>email</v-icon>
        </v-btn>
      </div>
    </v-expansion-panel-content>
  </div>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex';
  import {UPDATE_INCIDENT} from '@/store/modules/incident/action-types';
  import IncidentForm from '@components/global/IncidentForm';

  export default {
    name: 'ExpansionIncidentsListElement',
    components: {IncidentForm},
    props: ['incident'],
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