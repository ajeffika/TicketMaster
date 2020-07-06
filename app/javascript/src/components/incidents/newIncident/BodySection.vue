<template>
  <div>
    <v-row class="pt-4">
      <v-col cols="3">
      </v-col>
      <v-col cols="6">
        <v-row>
          <v-col cols="12">
            <v-card elevation="20" dark class="rounded-corner text--white">
              <div class="text-center pt-4 fluid ">
                <h2>{{$t('incident.newIncident.title')}}</h2>
              </div>
              <div class="text-center p-4 text-xl-caption">
                {{$t('incident.newIncident.description')}}
              </div>
              <div>
                <incident-form :incident="incident" @submitAction="submit"/>
              </div>
            </v-card>
          </v-col>
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
  .opacity{
    backdrop-filter: blur(18px) grayscale(8%);
    background-color: transparent!important;
    border-color: transparent!important;
    opacity: 1.8;
  }
  .rounded-corner {
    border-radius: 20px !important;
  }
</style>
