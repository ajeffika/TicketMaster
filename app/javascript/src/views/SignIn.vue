<template>
  <v-row no-gutters>
    <div class="container-height__modifier">
      <v-container fill-height fluid>
        <v-row align="center"
               justify="center">
          <v-col cols="12" md="6"  class=" pt-5 pt-md-0 px-md-0">
            <v-card elevation="20" dark class="pa-6 rounded-corner ">
              <div class="form-wrapper text-center">
                <div class="d-flex justify-space-between">
                  <v-btn tile outlined color="secondary" class="form-wrapper--button mb-5" @click="goHome">
                    {{$t('global.custom.goHome')}}
                    <v-icon>mdi-home</v-icon>
                  </v-btn>
                </div>
                <div class="form-wrapper--content pb-5 pb-md-0 mt-5 mt-md-0">
                  <div class="display-3">{{$t('auth.form.signIn')}}</div>
                </div>
                <div class="hr-line-with-icon--line"></div>
              </div>

              <sign-in-form :user="user" @submit="submit"/>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </div>
  </v-row>
</template>

<script>
  import {mapActions} from 'vuex'
  import {SIGN_IN} from '@/store/modules/auth/action-types'
  import SignInForm from '@components/signIn/Form'
  import OmniAuthService from '@helpers/omni-auth-service'

  export default {
    name: 'SignInView',
    components: {SignInForm},
    mixins: [OmniAuthService],
    data: () => {
      return {
        user: {
          email: '',
          password: ''
        },
      }
    },
    methods: {
      ...mapActions({
        signIn: `auth/${SIGN_IN}`
      }),
      submit() {
        this.signIn(this.user)
      },
      goHome() {
        this.$router.push({name: 'home'})
      },
    }
  }
</script>

<style lang="scss" scoped>
  .form-wrapper {
    flex-direction: column;
    justify-content: center;
    display: flex;
    height: 100%;

    &--content {
      width: 100%;
    }

    &--button {
      align-self: flex-end;
    }
  }

  .background-image {
    box-shadow: 0 2px 9px 0 #730E15;
    position: relative;

    &--text {
      position: absolute;
      top: 45%;
      left: 50%;
      transform: translate(-50%, -50%);

      .display-3 {
        line-height: 4.20rem;
      }
    }
  }

  .hr-line-with-icon {
    display: flex;

    &--line {
      width: 100%;
      position: relative;
      margin: 7px;
      border-bottom: 1px solid #FFF;
    }

    &--content {
      position: relative;
      top: 3px;
    }
  }

  .container-height__modifier {
    height: 75vh;
    width: 100%;
  }
</style>
