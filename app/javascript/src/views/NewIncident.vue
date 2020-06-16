<template>
  <div>
    TicketSubmition
    <incident-form :incident="incident" @submitAction="submit" />
  </div>

</template>

<script>
  import IncidentForm  from '@components/global/IncidentForm'
  import { CREATE_INCIDENT } from '@/store/modules/incident/action-types'
  import { mapActions } from 'vuex'

  export default {
    name: 'NewIncidentView',
    components: {  IncidentForm },
    data: () => {
      return {
        incident: {
          title: '',
          description: '',
          categoryId: '',
          userId: '',
          status: '',
          pending: '',
          groupId: '',
          attachment: '',
          number: '',
          slug: '',
          step: ''
        }
      }
    },
    methods: {
      ...mapActions({
        createIncident: `incident/${CREATE_INCIDENT}`
      }),
      submit() {
        this.createIncident({ incident: this.incident })
      }
    }
  }
</script>
