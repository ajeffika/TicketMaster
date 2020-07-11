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
                <user-form :user="user"  @submitAction="submit"/>
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
  import UserForm from '@components/admin/UserForm'
  import {mapActions, mapGetters} from "vuex";
  import {FETCH_USER} from "../../store/modules/user/action-types";
  import {UPDATE_USER} from "../../store/modules/user/action-types";

  export default {
    name: 'UserFormView',
    components: {UserForm},
    created() {
      this.fetchUser({id: this.$route.params.userId})
    },
    computed: {
      ...mapGetters({
        user: 'user/record',
      }),
    },
    methods: {
      ...mapActions({
        fetchUser: `user/${FETCH_USER}`,
        updateUser: `user/${UPDATE_USER}`

      }),
      submit() {
        this.updateUser({user: this.user})
      }
    },
  }
</script>
