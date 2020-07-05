<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12" md="6" offset-md="3">
        <v-card>
          <v-container fluid>
            <h1>
              {{$t('incident.incidentList.title')}}
              <div class="float-right">
                {{incidents.length}}/{{incidents.length}}
              </div>
            </h1>
            <div v-if="incidents.length > 0" class="mt-3">
              <expansion-incidents-list :incidents="incidents"/>
            </div>
            <v-btn v-else :to="{ name: 'newEntry'}" class="mt-3 primary">
              {{$t('myEntries.addNewEntry')}}
            </v-btn>
          </v-container>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  import ExpansionIncidentsList from '@components/incidents/incidentList/ExpansionIncidentsList';
  import { mapActions, mapGetters } from 'vuex';
  import { FETCH_INCIDENT } from '@/store/modules/incident/action-types';
  import {FETCH_INCIDENTS} from "../../../store/modules/incident/action-types";

  export default {
    name: 'MyIncidents',
    components: { ExpansionIncidentsList },
    created() {
      this.fetchIncidents({ userId: this.user.id });
    },
    computed: {
      ...mapGetters({
        user: 'auth/user',
        incidents: 'incident/list',
        recordsAreLoading: 'incident/recordsAreLoading',
      }),
    },
    methods: {
      ...mapActions({
        fetchIncidents: `incident/${FETCH_INCIDENTS}`,
      }),
    },
  };
</script>