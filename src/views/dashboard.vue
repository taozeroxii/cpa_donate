<template>
  <div class="small">
    <v-btn color="primary"  class="btn btn--success" @click="fillData()">Random กราฟ  </v-btn>
    <line-chart v-if="datacollection!=null" :chart-data="datacollection"></line-chart>
  </div>
</template>

<script>
  import LineChart from '@/components/charts/LineChart'

  export default {
    components: {
      LineChart
    },
    data () {
      return {
        datacollection: null
      }
    },
    mounted () {
      this.fillData()
    
    },
    methods: {
      fillData () {
        this.datacollection = {
          labels: [this.getRandomInt(), this.getRandomInt()],
          datasets: [
            {
              label: 'Data One',
              fill:false,
              backgroundColor: '#f87979',
              data: [this.getRandomInt(), this.getRandomInt()]
            }, {
              label: 'Data two',
                fill:false,
              backgroundColor: '#fffff',
              data: [this.getRandomInt(), this.getRandomInt()]
            }
          ]
        }
      },
      getRandomInt () {
        return Math.floor(Math.random() * (50 - 5 + 1)) + 5
      }
    }
  }
</script>

<style>
  .small {
    max-width: 600px;
    margin:  150px auto;
  }
</style>