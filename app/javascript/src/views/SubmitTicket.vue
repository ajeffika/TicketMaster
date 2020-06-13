<template>
  <div>
    TicketSubmition
    <incident-form :incident="incident" @submitAction="update"></incident-form>
  </div>

</template>

<script>
  import { mapActions, mapGetters } from 'vuex';
  import { UPDATE_INCIDENT } from '@/store/modules/incident/action-types';
  import IncidentForm from '@components/global/IncidentForm';

  export default {
    name: 'SubmitTicket',
    components: { IncidentForm },
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
        this.updateIncident({ incident: this.incident });
        this.editable = 0;
      },
    },
  };
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
