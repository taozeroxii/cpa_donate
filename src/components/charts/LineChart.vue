<script>
import { Line, mixins } from "vue-chartjs";
const { reactiveProp } = mixins;

export default {
  extends: Line,
  mixins: [reactiveProp],
  data() {
    return {
      options: { 
        legend: {
          display: true
        },
        maintainAspectRatio: false, // ไม่ต้องปรับค่าความสูงเองให้ฟิกตามที่ตั้งไว้
        
      },
    };
  },
  mounted() {
    // this.chartData is created in the mixin.
    // If you want to pass options please create a local options object
    this.renderChart(this.chartData, this.options);
  },
};
</script>

<style></style>
