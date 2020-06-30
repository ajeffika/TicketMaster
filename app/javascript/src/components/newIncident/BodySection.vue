<template>
  <div>
    <v-row class="pt-4">
      <v-col cols="3">
      </v-col>
      <v-col cols="6" class="grey lighten-5 rounded">
        <v-row>
          <v-col cols="12">
            <div class="text-center p-4 fluid ">
              <h2>{{$t('incident.newIncident.title')}}</h2>
            </div>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12">
            <div class="text-center p-4 text-xl-caption text--secondary">
              {{$t('incident.newIncident.description')}}
            </div>
          </v-col>
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
  import {mapActions} from "vuex";
  import {CREATE_INCIDENT} from '@/store/modules/incident/action-types'

  export default {
    name: 'HomeView',
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
<style>
  .rounded{
    border-radius:15px;
  }
</style>
