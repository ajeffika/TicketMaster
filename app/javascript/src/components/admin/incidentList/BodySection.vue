<template>
  <v-container fluid>
    <v-row>
      <v-col cols="12" md="6" offset-md="3">
        <v-card dark class="pa-6">
          <v-container fluid class=" rounded-corner">
            <h1>
              {{$t('incident.incidentList.title')}}
              <div class="float-right">
                {{incidents.length}}/{{incidents.length}}
              </div>
            </h1>
            <div v-if="incidents.length > 0" class="mt-3">
              <expansion-incidents-list :incidents="incidents"/>
            </div>
          </v-container>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>HomePager

<script>
  import ExpansionIncidentsList from '@components/admin/incidentList/ExpansionIncidentsList';
  import {mapActions, mapGetters} from 'vuex';
  import {FETCH_INCIDENTS} from "../../../store/modules/incident/action-types";
  import {FETCH_GROUPS} from "../../../store/modules/group/action-types";

  export default {
    name: 'MyIncidents',
    components: {ExpansionIncidentsList},
    created() {
      this.fetchUserGroups()
      this.fetchIncidents({groupIds: this.groups.map(group => group.id)});
    },
    computed: {
      ...mapGetters({
        user: 'auth/user',
        incidents: 'incident/list',
        recordsAreLoading: 'incident/recordsAreLoading',
        groups: 'group/list',
      }),
    },
    methods: {
      ...mapActions({
        fetchUserGroups: `group/${FETCH_GROUPS}`,
        fetchIncidents: `incident/${FETCH_INCIDENTS}`,
      }),
    },
  };
</script>