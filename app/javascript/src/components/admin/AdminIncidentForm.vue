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
        :data-vv-as="$t('incident.form.description')"
        color="dark"
        item-text="name"
        item-value="value"
        item-color="secondary"
      ></v-textarea>
      <v-select
        v-model="incident.step"
        :items="stepItems"
        label="Step"
        dense
      ></v-select>
<!--      <v-textarea-->
<!--        v-model="incident.step"-->
<!--        v-validate="'required'"-->
<!--        :error-messages="errors.collect('step')"-->
<!--        :label="$t('incident.form.step')"-->
<!--        data-vv-name="description"-->
<!--        :data-vv-as="$t('incident.form.step')"-->
<!--        color="dark"-->
<!--        item-text="name"-->
<!--        item-value="value"-->
<!--        item-color="secondary"-->
<!--      ></v-textarea>-->
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
      <v-row>
        Category => {{currentCategory.name}}
      </v-row>
    </form>
    <v-card-actions class="mt-3">
      <v-spacer/>
      <v-btn color="success" @click="submit">
      </v-btn>
    </v-card-actions>
  </v-card-text>
</template>

<script>
  import {mapActions, mapGetters} from 'vuex'
  import {UPDATE_INCIDENT} from '@/store/modules/incident/action-types'
  import {FETCH_CATEGORIES} from '@/store/modules/category/action-types'
  import {FETCH_CATEGORY} from '@/store/modules/category/action-types'

  export default {
    name: 'AdminIncidentForm',
    props: ['incident'],
    $_veeValidate: {
      validator: 'new'
    },
    created() {
      this.fetchCategories();
      this.fetchCurrentCategory({id: this.incident.categoryId});
    },
    data() {
      return {
        params: {
          editable: false,
          editableIncident: {},
        },
        stepItems: ['fresh', 'resolved', 'pending'],

        incidentFields: [
          {name: 'title', validations: 'required|min:3'},
          {name: 'description', validations: 'required|min:3'},
          {name: 'categoryId', validations: 'required|min:3|unique:user-username'},
          {name: 'status', validations: 'required|email|'},
          {name: 'pending', validations: 'required|email|'},
          {name: 'step', validations: 'required|email|'},
        ],
      };
    },
    computed: {
      ...mapGetters({
        categories: 'category/categories',
        currentCategory: 'category/category',
      }),
    },
    methods: {
      ...mapActions({
        editIncident: `incident/${UPDATE_INCIDENT}`,
        fetchCategories: `category/${FETCH_CATEGORIES}`,
        fetchCurrentCategory: `category/${FETCH_CATEGORY}`,
      }),
      submit() {
        this.$validator.validateAll().then(result => {
          if (result) {
            this.$emit('submitAction')
            this.$router.push('admin_incident_list');
          }
        })
      }
    },
  };
</script>

<style>
  .overlay {
    backdrop-filter: blur(20px);
    opacity: 0.5;
  }
</style>