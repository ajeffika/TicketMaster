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
                <h2>{{$t('user.form.title')}}</h2>
              </div>
              <div class="text-center p-4 text-xl-caption">
                {{$t('user.form.description')}}
              </div>
              <div>
                <admin-incident-form :incident="incident" @submitAction="submit"/>
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
  import AdminIncidentForm from '@components/admin/AdminIncidentForm'
  import {mapActions, mapGetters} from "vuex";
  import {UPDATE_INCIDENT} from "../../store/modules/incident/action-types";
  import {FETCH_INCIDENT} from "../../store/modules/incident/action-types";

  export default {
    name: 'AdminIncidentFormView',
    components: {AdminIncidentForm},
    created() {
      this.fetchIncident({id: this.$route.params.incidentId})
    },
    computed: {
      ...mapGetters({
        incident: 'incident/record',
      }),
    },
    methods: {
      ...mapActions({
        fetchIncident: `incident/${FETCH_INCIDENT}`,
        updateIncident: `incident/${UPDATE_INCIDENT}`

      }),
      submit() {
        this.updateIncident({id: this.$route.params.incidentId, incident: this.incident})
      }
    },
  }
</script>
