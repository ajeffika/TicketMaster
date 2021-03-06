<template>
  <v-card-text class="  pb-4">
    <form>
      <v-text-field
        v-model="incident.title"
        v-validate="'required'"
        :error-messages="errors.collect('title')"
        :label="$t('incident.form.title')"
        data-vv-name="title"
        :data-vv-as="$t('incident.form.title')"
        color="dark"
        required
      ></v-text-field>
      <v-textarea
        v-model="incident.description"
        v-validate="'required'"
        :error-messages="errors.collect('description')"
        :label="$t('incident.form.description')"
        data-vv-name="description"
        :data-vv-as="$t('incident.form.scopeType')"
        color="dark"
        item-text="name"
        item-value="value"
        item-color="secondary"
      ></v-textarea>
      <v-row>
        <v-col cols="10">
          <div class="category-title-wrapper text--white mb-5 ml-1">
            {{$t('incident.form.categories')}}
          </div>
          <v-expansion-panels class="pb-4" accordion light tile>
            <v-expansion-panel v-for="category in categories" :key="category.name">
              <v-expansion-panel-header>{{category.name}}</v-expansion-panel-header>
              <v-expansion-panel-content>
                <v-radio-group v-model="incident.categoryId">
                  <v-radio
                    v-validate="'required'"
                    :error-messages="errors.collect('category')"
                    v-for="subCategory in category.children"
                    :key="subCategory.name"
                    :label="subCategory.name"
                    :rules="[v => v.length > 0 || 'You must agree to continue!']"
                    :value="subCategory.id"
                  ></v-radio>
                </v-radio-group>
              </v-expansion-panel-content>
            </v-expansion-panel>
          </v-expansion-panels>
        </v-col>
      </v-row>
    </form>
    <v-card-actions class="mt-3">
      <v-spacer/>
      <v-btn color="success" @click="submit">
        {{translatedSubmit}}
      </v-btn>
    </v-card-actions>
  </v-card-text>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex'
  import {FETCH_CATEGORIES} from '@/store/modules/category/action-types'

  export default {
    name: 'IncidentForm',
    props: ['incident'],
    $_veeValidate: {
      validator: 'new'
    },
    data() {
      return {
        categoryScope: 'category'
      }
    },
    created() {
      this.fetchCategories()
    },
    computed: {
      ...mapGetters({
        categories: 'category/categories',
        user: 'auth/user',
      }),

      translatedSubmit() {
        if (this.incident.id) {
          return this.$i18n.t('incident.form.updateIncident')
        } else {
          return this.$i18n.t('incident.form.saveIncident')
        }
      }
    },
    methods: {
      ...mapActions({
        fetchCategories: `category/${FETCH_CATEGORIES}`,
      }),
      submit() {
        this.$validator.validateAll().then(result => {
          if (result) {
            this.$emit('submitAction')
          }
        })
      }
    }
  }
</script>

<style>
  .overlay {
    backdrop-filter: blur(20px);
    opacity: 0.5;
  }
</style>