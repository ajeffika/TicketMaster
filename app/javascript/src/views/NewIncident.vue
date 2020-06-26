<template>
    <div>
      <v-row class="pt-4">
        <v-col cols="3">
        </v-col>
        <v-col cols="6">
          <v-row>
            <div class="text-center">
              <h2>{{$t('incident.newIncident.title')}}</h2>
            </div>
          </v-row>
          <v-row>
            <div class="text-center">
              {{$t('incident.newIncident.description')}}
            </div>
          </v-row>
          <v-row>
            <incident-form :incident="incident" @submitAction="submit"/>
          </v-row>
        </v-col>
        <v-col cols="3">
        </v-col>
      </v-row>
    </div>
</template>

<script>
  import IncidentForm from '@components/global/IncidentForm'
  import {CREATE_INCIDENT} from '@/store/modules/incident/action-types'
  import {mapActions} from 'vuex'

  export default {
    name: 'NewIncidentView',
    components: {IncidentForm},
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
        this.createIncident({incident: this.incident})
      }
    }
  }
</script>
